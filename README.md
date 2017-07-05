# Clipboard

Normally one could write

```
on "paste" decoder
```

The problem is clipboardData is not available afer event handler quit. So the data have to be extracted within event handler, and passing it to port doesn't work.

This solves it by just having a simple event handlder that extracts expected `mimeType` (such as `text/plain`) and returning it.

It doesn't handle any other cases (such as pasting images etc) nor copying (yet).
