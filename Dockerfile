FROM fedora 
MAINTAINER Zielu
RUN \ 
#    yum -y update && \
    yum -y install \
        wget \
        unzip \
        java-1.8.0-openjdk-devel.x86_64 \
        git-all \
        genisoimage && \ 
    cd /opt && \
    wget https://services.gradle.org/distributions/gradle-4.5.1-bin.zip && \
    wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
    unzip gradle-4.5.1-bin.zip && \
    tar xzf apache-maven-3.6.3-bin.tar.gz && \
    rm -f gradle-4.5.1-bin.zip && \
    rm -f  apache-maven-3.6.3-bin.tar.gz && \
    ln -s gradle-4.5.1 gradle && \
    ln -s apache-maven-3.6.3 maven && \ 
    echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-0.fc31.x86_64' > /etc/profile.d/java.sh && \
    echo 'export PATH=/opt/gradle/bin:${PATH}' > /etc/profile.d/gradle.sh && \
    echo 'export M2_HOME=/opt/maven' > /etc/profile.d/maven.sh && \
    echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/maven.sh && \
    source /etc/profile.d/java.sh && \
    source /etc/profile.d/gradle.sh && \
    source /etc/profile.d/maven.sh ;

