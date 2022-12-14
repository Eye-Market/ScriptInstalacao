#!/bin/bash
sudo apt update && sudo apt upgrade

VERSION="$(java -version 2>&1 | grep version | cut -d'"' -f2)"
if [ "${VERSION}" ];
then
        echo "Cliente possui java instalado: ${VERSION}"
else
        echo "Cliente não possui java instalado"

fi
java -version
if [ $? -eq 0 ];
then
        echo "java instalado"

        echo "Você deseja que a aplicação seja executada via interface? (s/n)"
        read instone
        if [ \"$instone\" == \"s\" ];
        then
        echo "instalando projeto via interface..."
                 cd /home/ubuntu/Desktop && git clone https://github.com/Eye-Market/AplicacaoJava.git
        echo "Iniciando aplicação..."
                 cd AplicacaoJava/EyeMarket/target
                 java -jar EyeMarket-1.0-SNAPSHOT-jar-with-dependencies.jar

        else
        echo "instalando projeto via terminal..."
                 git clone https://github.com/Eye-Market/AplicacaoCLI.git
        echo "Iniciando aplicação..."
                 cd AplicacaoCLI/EyeMarket/target
                 java -jar EyeMarket-1.0-SNAPSHOT-jar-with-dependencies.jar
        fi

else
        echo "java nao instalado"
        echo "gostaria de instalar o java? (s/n)"
        read inst
        if [ \"$inst\" == \"s\" ];
        then
                echo "instalando java"
                sudo apt install default-jre -y

                echo "Você deseja que a aplicação seja executada via interface? (s/n)"
        read instone
        if [ \"$instone\" == \"s\" ];
        then
        echo "instalando projeto via interface..."
                 cd /home/ubuntu/Desktop && git clone https://github.com/Eye-Market/AplicacaoJava.git
        echo "Iniciando aplicação..."
                 cd AplicacaoJava/EyeMarket/target
                 java -jar EyeMarket-1.0-SNAPSHOT-jar-with-dependencies.jar

        else
        echo "instalando projeto via terminal..."
                 cd /home/ubuntu/Desktop && git clone https://github.com/Eye-Market/AplicacaoCLI.git
        echo "Iniciando aplicação..."
                 cd AplicacaoCLI/EyeMarket/target
                 java -jar EyeMarket-1.0-SNAPSHOT-jar-with-dependencies.jar
        fi

        fi
fi

