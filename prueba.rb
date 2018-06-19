opt = 0
while opt != 4
  puts "MENU\n*****************************"
  puts '1.- Promedio por alumno'
  puts '2.- Inasistencias por alumno'
  puts '3.- Alumnos aprobados'
  puts '4.- Salir del programa'
  print 'Ingrese una opcion: '
  opt = gets.chomp.to_i
  case opt
  when 1
    puts 'hola'
  when 2
    puts 'hola'
  when 3
    puts 'hola'
  when 4
    puts 'Programa terminado'
  else
    puts 'Debe Ingresar una opcion valida'
  end
end
