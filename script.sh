import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


/*
* Remember to change the permission of kafkaPrdo.sh to write [chmod -x kafkaProd.sh]
*
* */
public class Driver {
    public static void main(String[] args) throws IOException {
        String[] cmds = new String[] {"src/kafkaProd.sh"};
        ProcessBuilder processBuilder = new ProcessBuilder(cmds);

        Process process = processBuilder.start();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String s = null;
        while((s = bufferedReader.readLine()) != null){
            System.out.println(s);
        }
    }
}

#!/bin/bash

cd /home/tawfik/Softy/

./kafka/bin/kafka-server-start.sh -daemon /home/tawfik/Softy/kafka/config/server.properties

./kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic tpt

./kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic tpt

for x in {1..20}; do echo $x; sleep 2; done | ./kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic tpt




#####################################################################################


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/*
 * Remember to change the permission of kafkaCons.sh to write [sudo chmod +x kafkaCons.sh]
 *
 * */
public class Driver {
    public static void main(String[] args) throws IOException {
        String[] cmds = new String[] {"src/kafkaCons.sh"};
        ProcessBuilder processBuilder = new ProcessBuilder(cmds);

        Process process = processBuilder.start();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String s = null;
        while((s = bufferedReader.readLine()) != null){
            System.out.println(s);
        }
    }
}


#!/bin/bash

cd /home/tawfik/Softy/

./kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic tpt --from-beginning




