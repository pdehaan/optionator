{map, sort-by}:prelude = require 'prelude-ls'
fl = require 'fast-levenshtein'

closest-string = (possibilities, input) ->
  return unless possibilities.length
  distances = possibilities |> map ->
    [longer, shorter] = if input.length > it.length then [input, it] else [it, input]
    {string: it, distance: fl.get longer, shorter}

  {string, distance} = sort-by (.distance), distances .0
  string

name-to-raw = (name) -> if name.length is 1 or name is 'NUM' then  "-#name" else "--#name"

dasherize = (string) ->
  if /^[A-Z]/.test string
    string
  else
    prelude.dasherize string

module.exports = {closest-string, name-to-raw, dasherize}
