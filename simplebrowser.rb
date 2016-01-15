require 'tk'


root = TkRoot.new
s = Tk::Tile::Scrollbar.new(root) {orient "vertical";
command proc{|*args| l.yview(*args);} }
l['yscrollcommand'] = proc{|*args| s.set(*args);}

textPad = ScrolledText.ScrolledText(root, width=100, height=80) # creates text area

# create a menu
def dummy()
    puts "I am a Dummy Command, I will be removed in the next step"
end

menu = Menu(root)
root.config(menu=menu)
filemenu = Menu(menu)
menu.add_cascade(label="File", menu=filemenu)
filemenu.add_command(label="New", command=dummy)
filemenu.add_command(label="Open...", command=dummy)
filemenu.add_command(label="Save", command=dummy)
filemenu.add_separator()
filemenu.add_command(label="Exit", command=dummy)
helpmenu = Menu(menu)
menu.add_cascade(label="Help", menu=helpmenu)
helpmenu.add_command(label="About...", command=dummy)
# end of menu creation

textPad.pack()
root.mainloop()