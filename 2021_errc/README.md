# Quantidade de pacotes

Testes de execução em um interválo de 10 segundos de acordo com o descrito nos
resultados. Foram realizadas três execuções de cada testes, sendo apresentada
uma média aritimética simples. 

Com isso é possível ver que mesmo sem o uso do mutex ou semaforo a limitação
na quantidade de pacotes está diretamente relacioanda com a limitação imposta
na compilação necessária para obtenção dos valores exatos de médias. Os resultados
das execuções estão neste [arquivo csv](./resultados_210901.csv)

|---|Total      | pps       | Execução
|---|-----------|-----------|---------------------------------------------
| 1 |22.537.000 | 2.253.700 | Somente encaminhamento de pacotes com header ipv4
| 2 |21.986.000 | 2.198.600 | + header udp s/ uso
| 3 |21.724.000 | 2.172.400 | + header apf s/ uso
| 4 |21.108.000 | 2.110.800 | + metadata time s/ uso
| 5 |17.905.000 | 1.790.500 | + uso do header apf c/ setInvalid
| 6 |13.239.000 | 1.324.200 | + calculo e armazenamento nos registradores
| 7 |12.384.000 | 1.238.400 | + microC que soma metricas s/ mutex
| 8 |12.223.000 | 1.223.400 | + contador de pacotes com mutex
| 9 |11.014.000 | 1.101.500 | + incluído mutex a cada 5 pacotes (%5==0)
|10 |11.016.000 | 1.101.600 | + mutex a cada 100 pacotes (%100== 0)
|11 |12.095.000 | 1.209.500 | Sem. local para contar pacotes
|12 |10.048.000 | 1.004.800 | Sem. local a cada 5 pacotes (%5==0)
|13 |10.054.000 | 1.005.400 | Sem. local a cada 100 pacotes (%100==0)
|14 |12.081.000 | 1.208.100 | Sem. global para contar pacotes
|15 | 9.876.000 |   987.600 | Sem. global a cada 5 pacotes (%5==0)
|16 | 9.888.000 |   988.800 | Sem. global a cada 100 pacotes (%100==0)

- **Comparativo pps**

|---|  Mutex    |  Sem. Local | Sem. Global | Execução
|---|-----------|-------------|-------------|---------------
| A | 1.223.400 | 1.209.500   | 1.208.100   | + contador...
| B | 1.101.500 | 1.004.800   |   987.600   | + (%5==0)...
| C | 1.101.600 | 1.005.400   |   988.800   | + (%100== 0)...

