xquery version "1.0";

for $x in doc("https://sfgaimer.github.io/hw8.xml")/bookstore/book
where $x/price<=30
order by $x/title
return $x/title
