def readfile(archive)
  file = File.open(archive, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  data
end

def obtener_promedio(archive)
  promedios = ''
  file = readfile(archive)
  file.each do |line|
    arr = line.split(', ')
    name = arr.shift
    prom = arr.inject(0) { |acc, num| acc + num.to_i } / arr.length.to_f
    promedios += "#{name}, #{prom}\n"
  end
  promedios
end

def promedio
  promedios = obtener_promedio('alumnos.csv')
  File.open('promedio.csv', 'w') { |f| f.puts promedios }
  print promedios
end

def inasistencias
  file = readfile('alumnos.csv')
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

def aprobados(aprueba = 5.0)
  promedios = obtener_promedio('alumnos.csv').split("\n")
  puts "Aprobados con nota (#{aprueba}): "
  promedios.each do |line|
    arr = line.split(', ')
    puts "#{arr[0]} aprueba con nota: #{arr[1]}" if arr[1].to_f >= aprueba
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
    print 'Ingrese la nota para aprobar el curso: '
    aprueba = gets.chomp.to_f
    aprueba.zero? ? aprobados : aprobados(aprueba)
  when 4
    puts 'Programa terminado'
  else
    puts 'Debe Ingresar una opcion valida'
  end
end
