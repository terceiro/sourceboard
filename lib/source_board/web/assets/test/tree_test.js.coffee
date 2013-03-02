#= require tree
#= require jquery

input = [
  { path: 'foo/bar.js', name: 'bar.js', metrics: { loc: 10, nom: 5 } },
  { path: 'foo/baz.js', name: 'baz.js', metrics: { loc: 5, nom: 2 } },
  { path: 'foo/bar/baz.js', name: 'baz.js', metrics: { loc: 5, nom: 2 } },
  { path: 'foo/bar/qux.js', name: 'qux.js', metrics: { loc: 5, nom: 2 } }
]

tree = new Tree(input)

test "tree root", ->
  ok(tree.children_by_name['foo'] instanceof Tree)

test "nested directories", ->
  ok(tree.children_by_name['foo'].children_by_name['bar'] instanceof Tree)

test "file inside directory", ->
  equal(tree.children_by_name['foo'].children_by_name['bar.js'].name, 'bar.js')

test "file inside nested directory", ->
  equal(
    tree.children_by_name['foo'].children_by_name['bar'].children_by_name['qux.js'].name,
    'qux.js'
  )

test "maximum metric values", ->
  equal(tree.max['loc'], 10)
  equal(tree.max['nom'], 5)

test "minimum metric values", ->
  equal(tree.min['loc'], 5)
  equal(tree.min['nom'], 2)
