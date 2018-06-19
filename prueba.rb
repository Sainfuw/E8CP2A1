def saveread(archive)
  file = File.open(archive, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  data
end

def promedio
  file = saveread('alumnos.csv')
  File.open('promedio.csv', 'w') { |f| f.print '' }
  file.each do |line|
    arr = line.split(', ')
    name = arr.shift
    prom = arr.inject(0) { |acc, num| acc + num.to_i } / arr.length.to_f
    File.open('promedio.csv', 'a') { |f| f.print "#{name}, #{prom}\n" }
  end
end

def inasistencias
  file = saveread('alumnos.csv')
  file.each do |line|
    fault = 0
    arr = line.split(', ')
    name = arr.shift
    arr.each do |nota|
      fault += 1 if nota == 'A'
    end
    puts "#{name} tiene: #{fault} inasistencias"
  end
end

def aprobados(aprueba = 5)
  proms = saveread('promedio.csv')
  puts 'Aprobados : '
  proms.each do |line|
    arr = line.split(', ')
    puts arr[0] if arr[1].to_i >= aprueba
  end
end

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
    promedio
  when 2
    inasistencias
  when 3
    aprobados(7)
  when 4
    puts 'Programa terminado'
  else
    puts 'Debe Ingresar una opcion valida'
  end
end
