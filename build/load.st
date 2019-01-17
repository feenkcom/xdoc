"load latest version"
EpMonitor current disable.
Metacello new
  baseline: 'Xdoc';
  repository: 'github://feenkcom/xdoc/src';
  load.
EpMonitor current enable.
Smalltalk snapshot: true andQuit: false.
