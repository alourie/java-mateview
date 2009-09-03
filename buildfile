VERSION_NUMBER = "0.0.1"
GROUP = "readcareditor"
COPYRIGHT = "The Redcar Editor Team"

# Specify Maven 2.0 remote repositories here, like this:
repositories.remote << "http://www.ibiblio.org/maven2/"

SWT_VERSION = case java.lang.System.getProperty "os.name"
when /OS X/i
  "lib/osx/swt.jar"
when /linux/i
  "lib/linux/swt.jar"
end

LOCAL_LIBS = Dir["lib/org.eclipse.*.jar", "lib/joni.jar", "lib/jdom.jar", "lib/jcodings.jar"]

desc "The Java-mateview project Junit"
define "jmate-junit" do

  project.version = VERSION_NUMBER
  project.group = GROUP
  manifest["Implementation-Vendor"] = COPYRIGHT
  compile.with [SWT_VERSION, LOCAL_LIBS]
  test.compile.with # Add classpath dependencies
  test.using :junit
end

desc "The Java-mateview project Rspec"
define "jmate-specs" do

  project.version = VERSION_NUMBER
  project.group = GROUP
  manifest["Implementation-Vendor"] = COPYRIGHT
  compile.with [SWT_VERSION, LOCAL_LIBS]
  test.compile.with # Add classpath dependencies
  test.using :jtestr
end
