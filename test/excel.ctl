source :in, {
  :file => 'data/excel.xls',
  :parser => :excel
}, 
{
  :first_line_is_header => false,
  :fields => [ 
      :first_name,
      :last_name,
      :ssn,
      :age
  ]
}

transform :ssn, :sha1
transform(:ssn){ |n, v, r| v[0,24] }


destination :out, {
  :file => 'output/excel.out.txt'
}, 
{
  :order => [:first_name, :last_name, :ssn, :age]
}