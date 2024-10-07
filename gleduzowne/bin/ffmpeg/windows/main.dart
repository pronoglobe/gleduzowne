// Do it only on windows.
assert(Platform.isWindows);

var args = ['a', 'b', 'c'];
// Get current process directory.
var processDir = p.dirname(Platform.resolvedExecutable);
// Get external executable path.
final exe = p.join(processDir, 'bin', 'ffmpeg.exe');

debugPrint('[Run process] $exe ${args.join(' ')}');
final res = await Process.run(exe, args);
if (res.exitCode != 0) {
  throw Exception('Code: ${res.exitCode}\n stdout: ${res.stdout}\n stderr: ${res.stderr}}');
}
// Return process output.
return res.stdout.toString();