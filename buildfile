VERSION_NUMBER = "0.0.1"
# Group identifier for your projects
GROUP = "readcareditor"
COPYRIGHT = "The Redcar Editor Team"

# Specify Maven 2.0 remote repositories here, like this:
repositories.remote << "http://www.ibiblio.org/maven2/"

SWT_VERSION = case java.lang.System.getProperty "os.name"
when /OS X/i
  "lib/swt-osx.jar"
when /linux/i
  "lib/swt-linux.jar"
end

LOCAL_LIBS = Dir["lib/org.eclipse.*.jar", "lib/joni.jar", "lib/jdom.jar", "lib/jcodings.jar"]


desc "The Java-mateview project"
define "java-mateview" do
  project.version = VERSION_NUMBER
  project.group = GROUP
  manifest["Implementation-Vendor"] = COPYRIGHT
  compile.with [SWT_VERSION, LOCAL_LIBS]
  test.compile.with # Add classpath dependencies
  
  define "junit" do
    test.using :junit
  end
  
  define "spec" do
    test.using :rspec
  end
  
  package(:jar)
end
