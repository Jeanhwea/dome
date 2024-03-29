export JAVA_HOME=${JAVA_HOME:-/usr/local/java/jdk}
export MAVEN_HOME=${MAVEN_HOME:/usr/local/java/maven}

# export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar${CLASSPATH:+:${CLASSPATH}}
export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH
