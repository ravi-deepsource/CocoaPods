require "pathname"

module FileTree
  def to_tree(path, depth = 0)
    path = Pathname(path)
    indentation = " " * depth * 2
    tree = indentation << path.to_path << "\n"
    if path.directory?
      path.children.sort_by { |p| p.to_s.downcase }.each do |child|
        tree << to_tree(child, depth + 1)
      end
    end
    tree
  end

  module_function :to_tree
end
