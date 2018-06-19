def promedio(file)
  File.open('promedio.csv', 'w') { |f| f.print '' }
  file.each do |line|
    arr = line.split(', ')
    name = arr.shift
    prom = arr.inject(0) { |acc, num| acc + num.to_i } / arr.length.to_f
    File.open('promedio.csv', 'a') { |f| f.print "#{name}, #{prom}\n" }
  end
end

opt = 0
while opt != 4
  file = []
  File.open('alumnos.csv', 'r') { |f| file = f.readlines.map(&:chomp) }
  puts "MENU\n*****************************"
  puts '1.- Promedio por alumno'
  puts '2.- Inasistencias por alumno'
  puts '3.- Alumnos aprobados'
  puts '4.- Salir del programa'
  print 'Ingrese una opcion: '
  opt = gets.chomp.to_i
  case opt
  when 1
    promedio(file)
  when 2
    inasistencias(file)
  when 3
    aprobados(file)
  when 4
    puts 'Programa terminado'
  else
    puts 'Debe Ingresar una opcion valida'
  end
end
