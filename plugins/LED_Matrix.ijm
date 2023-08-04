run("Action Bar","/plugins/LED_Matrix.ijm");
exit(); 
<noGrid>
<stickToImageJ>
<line>
<button>
label=New Matrix
bgcolor=#7fcbcd
txtcolor=#006d70
arg=<macro>
run("Fresh Start");
newMatrix();
</macro>

<button>
label=Select Port
bgcolor=#00b99e
txtcolor=white
arg=<macro>
run("serial ext2");
ports=split(Ext.ports(),";");
port=call("ij.Prefs.get", "actionbar.r4port","");
Dialog.create("Select Serial Port");
Dialog.addChoice("Port",ports,port);
Dialog.show();
port=Dialog.getChoice();
call("ij.Prefs.set", "actionbar.r4port",port);
</macro>

<button>
label=Connect
bgcolor=#7fcbcd
txtcolor=#006d70
arg=<macro>
run("serial ext2");
ports=split(Ext.ports(),";");
if (Ext.alive()=='true') Ext.close();
Ext.open(ports[1],9600,'');
showStatus('Waiting...');
wait(2000);
showStatus('done');
</macro>

<button>
label=Send Frame
bgcolor=#00b99e
txtcolor=white
arg=<macro>
run("serial ext2");
frame();
dumpHex();
</macro>

<button>
bgcolor=#7fcbcd
txtcolor=#006d70
label=Hexdump
arg=<macro>
dumpHex();
</macro>

<button>
bgcolor=#ff8f8b
txtcolor=white
label=Close Serial
arg=<macro>
run("serial ext2");
if (Ext.alive()=='true') Ext.close();
</macro>
<separator>
<button>
bgcolor=#ff5f5b
txtcolor=white
label=X
arg=<close>


</line>
<codeLibrary>
var bytes;
function computeBytes() {
  bytes = newArray(0,0,0,0,0,0,0,0,0,0,0,0);
  for (i=0;i<96;i++) {
    xt=i%12;yt=floor(i/12);b=getPixel(xt,yt)/255;
    f=floor(i/8);
    bytes[f]+=(1-b)<<(7-i%8);
  }
}
function frame() {
  computeBytes(); 
  for (j=0;j<bytes.length;j++) {
    Ext.writeInt(bytes[j]);
  }
}
function dumpHex() {
  words = newArray(0,0,0);
  for (i=0;i<96;i++) {
    x=i%12;y=floor(i/12);b=getPixel(x,y)/255;
    f=floor(i/32);
    words[f]+=(1-b)<<(31-i%32);
  }

  f="const uint32_t frame[] = {\n";
  for (w=0;w<3;w++) f=f+" 0x"+IJ.pad(toHex(words[w]),8)+substring(',',0,1*(w<2));
  f=f+"\n};";
  print (f);
}
function newMatrix() {
newImage("Matrix", "8-bit white", 12, 8, 2);
run("Set... ", "zoom=3200 x=6 y=4");
drawGrid("#5ddaff");
function drawGrid(c) {
for (i=0.5;i<getWidth-1;i++) {
  makeLine(i, -0.5, i, getHeight);
  Overlay.addSelection(c, 0);
}
for (i=0.5;i<getHeight -1;i++) {
  makeLine(-0.5, i, getWidth,i);
  Overlay.addSelection(c, 0);
}
run("Select None");
}
}
</codeLibrary>
<startupAction>
newMatrix();
eval('js','tool = new BrushTool();if (tool!=null) tool.run("pencil");');
setForegroundColor(0, 0, 0);
setBackgroundColor(255, 255, 255);
</startupAction>

