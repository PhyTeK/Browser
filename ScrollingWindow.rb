require 'tk'
require 'tkextlib/tile'

root = TkRoot.new
$l = TkText.new(root) {width 40; height 10;
yscrollcommand proc{|*args| $s.set(*args)} }.grid :column => 0, :row => 0, :sticky => 'nwes'


$s = Tk::Tile::Scrollbar.new(root) {orient 'vertical';
command proc{|*args| $l.yview(*args)}}.grid :column => 1, :row => 0, :sticky => 'ns'

stat = Tk::Tile::Label.new(root) {text "Status message here";
anchor 'w'}.grid :column => 0, :row => 1, :sticky => 'we'

sz = Tk::Tile::SizeGrip.new(root).grid :column => 1, :row => 1, :sticky => 'se'
TkGrid.columnconfigure root, 0, :weight => 1
TkGrid.rowconfigure root, 0, :weight => 1


(0..99).each {|i| $l.insert 'end', "Line #{i} of 100"}

$menus = TkMenubar.new(root)

Tk.mainloop