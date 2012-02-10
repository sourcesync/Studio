import commands

for i in range(20,44):
	print i
	src = "%02d_thumb.png" % i
	cmd = "cp %s preview_%d.png" % (src,i)
	print cmd
	print commands.getstatusoutput(cmd)
	src = "%02d_thumb_red.png" % i
	cmd = "cp %s red_preview_%d.png" % (src,i)
	print cmd
	print commands.getstatusoutput(cmd)
