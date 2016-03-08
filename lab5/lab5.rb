#!/usr/bin/env ruby

def menu
  puts `clear`
  root = Directory.new
  root.array = Array.new
  while true
    puts "Welcome to Ruby's File System"
    puts "*" * 25
    puts "Main Menu:"
    puts "1. Create a File"
    puts "2. Create a Directory"
    puts "3. Create a Link"
    puts "4. Remove File/Directory/Link"
    puts "5. Display File System"
    puts "6. Exit"
    case gets.chomp.to_i
      when 1
        puts `clear`
        CreateFile(root)
        puts `clear`
      when 2
        puts `clear`
        CreateDir(root)
        puts `clear`
      when 3
        puts `clear`
        CreateLink(root)
        puts `clear`
      when 4
        puts `clear`
        DeleteItem(root)
        puts "Press <return> to continue"
        gets
        puts `clear`
      when 5
        puts `clear`
        Display(root, 1)
        puts "Press <return> to continue"
        gets
        puts `clear`
      when 6
        puts "Goodbye!"
        puts "*" * 25
        exit
      else
        puts `clear`
        puts "Try again!\n"
        puts "Press <return> to continue"
        gets
        puts `clear`
      end
    end
end   

def Display(root, indent)
  dirs = Array.new
  root.array.each do |x|
    if x.is_a?(Directory)
      dirs.push(x)
    elsif x.is_a?(Files)
      puts ("   "*indent) + "|" + x.name + " " + x.size + "\n"
    else
      puts ("   "*indent) + "|" + x.name + "\n"
    end
  end
  dirs.each do |x|
    puts ("   "*indent) + "|" + x.name + "\n"
    Display(x, indent+1)
  end
end

def CreateLink(root)
  link = Links.new
  print "Please enter a Link name or quit: "
  if ((link.name = gets.chomp) == "quit")
    exit
  end
  print "Please enter a item to link to or quit: "
  if ((link.linkName = gets.chomp) == "quit")
    exit
  end
  print "Please enter a parent direcory or quit: "
  if ((link.parentdir = gets.chomp) == "quit")
    exit
  end
  if !(tmp = exists(root, link.linkName).nil?)
    if link.parentdir == "."
      root.array.push(link)
    else
      parentArray = existsDir(root, link.parentdir)
      if parentArray.nil?
        puts "Parrent Dir does not exist" 
        puts "Press <return> to continue"
        gets
      else
        parentArray.push(link)
      end
    end
  else
    puts "Linking item does not exist" 
    puts "Press <return> to continue"
    gets
   end
end

def existsDir(root, value)
  root.array.each do |x|
    if x.is_a?(Directory)
      if x.name == value
        return x.array
      end
      if (tmp = existsDir(x, value)) != nil
        return tmp
      end
    end
  end
  return nil
end

def exists(root, value)
  root.array.each do |x|
    if x.name == value
      return root.array
    end
    if x.is_a?(Directory)
      return exists(x, value)
    end
  end
  return nil
end

def DeleteItem(root)
  print "Please enter a File, Dir, or Link name or quit: "
  if ((name = gets.chomp) == "quit")
    exit
  end
  tmp = exists(root, name) 
  if tmp.nil?
    puts "ERROR: ITEM NOT FOUND"
  else
    tmp.delete_if { |x| x.name == name }
    puts name + " was deleted"
  end
end

def CreateFile(root)
  file = Files.new
  print "Please enter a File name or quit: "
  if ((file.name = gets.chomp) == "quit")
    exit
  end
  print "Please enter a parent direcory or quit: "
  if ((file.parentdir = gets.chomp) == "quit")
    exit
  end
  print "Please enter the size of the file (S/M/L): "
  if ((file.size = gets.chomp) == "quit")
    exit
  end
  if file.parentdir == "."
    root.array.push(file)
  else
    parentArray = existsDir(root, file.parentdir)
    if parentArray.nil?
      puts "Parrent Dir does not exist" 
      puts "Press <return> to continue"
      gets
    else
       parentArray.push(file)
    end
  end
end

def CreateDir(root)
  dir = Directory.new
  dir.array = Array.new
  puts "Please enter a Directory name or quit: "
  if ((dir.name = gets.chomp) == "quit") 
    exit
  end
  puts "Please enter a parent direcory or quit: "
  if ((dir.parentdir = gets.chomp) == "quit") 
    exit
  end
  if dir.parentdir == "."
    root.array.push(dir)
  else
    parentArray = existsDir(root, dir.parentdir)
    if !parentArray.nil?
      parentArray.push(dir)
    end
  end
end

class Item
  attr_accessor :name
  attr_accessor :parentdir
  attr_accessor :permissions
end

class Files < Item
  attr_accessor :size
end

class Directory < Item
  attr_accessor :updDate
  attr_accessor :array
end

class Links < Item
  attr_accessor :linkName
end

menu.new
  
