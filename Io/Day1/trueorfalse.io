# Conditions are in parenthesis because
# "false println" would print "false" for me,
# but "true println" was throwing an exception

# Is 0 true or false?
(0 or false) println
# true
(0 and true) println
# true

# What about the empty string?
("" or false) println
# true
("" and true) println
# true

# Is nil true or false?
(nil or false) println
# false
(nil and true) println
# false
