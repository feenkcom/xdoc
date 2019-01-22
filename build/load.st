"load latest version"
EpMonitor current disable.
Metacello new
   baseline: 'GToolkitExamples';
   repository: 'github://feenkcom/gtoolkit-examples/src';
   load.
Metacello new
  baseline: 'Xdoc';
  repository: 'github://feenkcom/xdoc/src';
  load.
EpMonitor current enable.
Smalltalk snapshot: true andQuit: false.
