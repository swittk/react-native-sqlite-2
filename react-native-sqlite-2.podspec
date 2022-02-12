require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

# This is copied from requery/sqlite-android https://github.com/requery/sqlite-android/blob/25c5d9e87f92c22634d4b924f15d12198889d81f/sqlite-android/src/main/jni/sqlite/Android.mk#L8
sqlite_compile_flags = '-DNDEBUG=1 -DHAVE_USLEEP=1 -DSQLITE_HAVE_ISNAN  -DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576  -DSQLITE_THREADSAFE=2  -DSQLITE_TEMP_STORE=3  -DSQLITE_POWERSAFE_OVERWRITE=1  -DSQLITE_DEFAULT_FILE_FORMAT=4  -DSQLITE_DEFAULT_AUTOVACUUM=1  -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1  -DSQLITE_ENABLE_FTS3  -DSQLITE_ENABLE_FTS3_PARENTHESIS  -DSQLITE_ENABLE_FTS4    -DSQLITE_ENABLE_FTS4_PARENTHESIS    -DSQLITE_ENABLE_FTS5    -DSQLITE_ENABLE_FTS5_PARENTHESIS  -DSQLITE_ENABLE_JSON1  -DSQLITE_ENABLE_RTREE=1  -DSQLITE_UNTESTABLE  -DSQLITE_OMIT_COMPILEOPTION_DIAGS  -DSQLITE_DEFAULT_FILE_PERMISSIONS=0600    -DSQLITE_DEFAULT_MEMSTATUS=0    -DSQLITE_MAX_EXPR_DEPTH=0    -DSQLITE_USE_ALLOCA    -DSQLITE_ENABLE_BATCH_ATOMIC_WRITE    -O3'

Pod::Spec.new do |s|
  s.name         = "react-native-sqlite-2"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "11.0", :osx => "10.14", :tvos => "11.0" }
  s.source       = { :git => "https://github.com/swittk/react-native-sqlite-2.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,c}"
  s.requires_arc = true
  s.compiler_flags = sqlite_compile_flags
  # s.library      = "sqlite3"

  s.dependency "React-Core"
end
