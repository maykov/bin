import subprocess
import gdb

def goto_selected_frame():
  try:
    frame = gdb.selected_frame()
  except gdb.error:
    return # no frame selected
  filename, line = to_loc(frame.find_sal())
  if filename:
    goto_file(filename, line)

def to_loc(sal):
  if sal is not None and sal.symtab is not None:
    return sal.symtab.filename, int(sal.line)
  else:
    return None, None

def goto_file(filename, line):
  subprocess.call('selvim.sh %s %s' % (filename, line), shell=True)

def on_prompt(prompt):
    goto_selected_frame()

gdb.prompt_hook = on_prompt
