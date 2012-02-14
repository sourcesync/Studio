import commands

for i in range(1,13):
	print i
	orig = "studio%02d_icon.jpg" % i
	src = "studio%02d_icon.jpg" % i
	cmd = "convert %s %s" % ( orig,src )
	print commands.getstatusoutput(cmd)
	cmd = "cp %s preview_%d.png" % (src,i)
	print cmd
	print commands.getstatusoutput(cmd)
	orig = "studio%02d_icon_red.jpg" % i
	src = "studio%02d_icon_red.png" % i
	cmd = "convert %s %s" % ( orig,src )
	print commands.getstatusoutput(cmd)
	cmd = "cp %s red_preview_%d.png" % (src,i)
	print cmd
	print commands.getstatusoutput(cmd)
