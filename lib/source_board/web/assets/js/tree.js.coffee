class Tree

  constructor: (@data) ->
    @children = {}
    @max = {}
    @min = {}
    $.each @data, (i,item) =>
      this.insert(item.path.split('/'), item)

  insert: (path, item) ->
    if path.length == 1
      @children[path[0]] = item
    else
      next_level = path.shift()
      subtree = this.children[next_level]
      if not subtree
        subtree = new Tree([])
        @children[next_level] = subtree
      subtree.insert(path, item)
    if item.metrics
      for metric, val of item.metrics
        if val > (@max[metric] ? 0)
          @max[metric] = val
        if val < (@min[metric] ? Infinity)
          @min[metric] = val

(exports ? this).Tree = Tree
