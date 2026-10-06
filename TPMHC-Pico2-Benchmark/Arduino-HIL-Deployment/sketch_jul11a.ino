#include <Arduino.h>
#include "crypto_workload_target.h"  // MATLAB이 생성한 진짜 헤더 파일 호출!

void setup() {
    Serial.begin(115200);
    delay(4000); 
    Serial.println("\n=========================================================================");
    Serial.println("   [RP2350 하드웨어 실측] MT 방식 vs T-PMHC (Galois + Hash) 정밀 비교");
    Serial.println("=========================================================================");
}

void loop() {
    double N_array[4] = {8.0, 16.0, 32.0, 64.0};
    
    // 초기 워밍업 (캐시 및 파이프라인 안정화를 위한 더미 실행)
    double dummy1, dummy2, dummy3;
    crypto_workload_target(8.0, &dummy1, &dummy2, &dummy3);

    Serial.println("\n-------------------------------------------------------------------------");
    Serial.println(" N  | [MT 방식]  | --- [T-PMHC 방식 상세] --- | [T-PMHC 합계] | 속도 비교");
    Serial.println("    |  MT (ms)   |  Galois (ms)  |  Hash (ms)   |  Total (ms)   | (MT/Total)");
    Serial.println("-------------------------------------------------------------------------");

    for (int i = 0; i < 4; i++) {
        double N = N_array[i];
        
        // 정밀도를 높이기 위해 각 N마다 100회 반복 연산 후 평균값 누적
        double sum_mt = 0.0;
        double sum_poly = 0.0;
        double sum_hash = 0.0;
        const int iter = 100;

        unsigned long hw_start = micros(); // 전체 물리 소요시간 크로스 체크용

        for(int k = 0; k < iter; k++) {
            double t_mt = 0.0, t_poly = 0.0, t_hash = 0.0;
            
            // MATLAB Coder가 변환한 진짜 C 언어 암호 알고리즘 알맹이 실행!
            crypto_workload_target(N, &t_mt, &t_poly, &t_hash);
            
            sum_mt += t_mt;
            sum_poly += t_poly;
            sum_hash += t_hash;
        }
        
        unsigned long hw_end = micros();
        
        // 1회 연산 당 평균 시간 (ms 단위)
        double avg_mt   = sum_mt / iter;
        double avg_poly = sum_poly / iter;
        double avg_hash = sum_hash / iter;
        
        // T-PMHC 최종 합계 시간 (Galois + Hash)
        double tpmhc_total = avg_poly + avg_hash;
        
        // 속도 개선 비율 (MT 대비 T-PMHC가 몇 배 빠르거나 느린지)
        double ratio = avg_mt / tpmhc_total;

        // 시리얼 모니터에 표(Table) 형식으로 깔끔하게 출력
        Serial.print(" ");
        if(N < 10) Serial.print(" ");
        Serial.print((int)N);
        Serial.print(" |  ");
        Serial.print(avg_mt, 4);
        Serial.print("    |   ");
        Serial.print(avg_poly, 4);
        Serial.print("     |  ");
        Serial.print(avg_hash, 4);
        Serial.print("    |   ");
        Serial.print(tpmhc_total, 4);
        Serial.print("    |   ");
        Serial.print(ratio, 2);
        Serial.println("x");
    }
    Serial.println("-------------------------------------------------------------------------");
    Serial.println(">> 5초 후 하드웨어 재측정...");
    delay(5000); 
}