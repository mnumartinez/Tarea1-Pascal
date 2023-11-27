procedure readAndHashLn(semilla, paso, N: Natural; var codigo: Natural);
var
  caracter: Char;
  acumulador: Natural;
begin
  acumulador := semilla;
  codigo := 0;

  read(caracter);
  
  // Itera "caracter" y procesa cada elemento del mismo hasta toparse con un punto (.)
  while (caracter <> '.') do
  begin
    // Esta expresión convierte los caracteres en números y utiliza una fórmula específica para generar un código irreversible.
    acumulador := (acumulador * paso + ord(caracter)) mod N;

    read(caracter);
  end;
    // Consume el resto de la línea luego del punto (.)
    readln();
    // Ahora "codigo"(parametro del procedure "login") tiene el valor (Hash) del acumulador
    codigo := acumulador;
end;


procedure login(codigo: Natural; intentos: Integer;
 var ok: Boolean);
var
  intento, codigoIngresado: Natural;
begin
  ok := False;
  intento := 1;
  
  while (intento <= intentos) and (not ok) do
  begin
    // Se invoca al procedimiento "readAndHashLn" para obtener el código
    readAndHashLn(SEMILLADJB, PASODJB, NDJB, codigoIngresado);
    
    if codigoIngresado = codigo then
      ok := True
    else
    begin
      // WriteFallo es un procedimiento que avisa cuando el login no se pudo realizar correctamente
      writeFallo(codigoIngresado, intento, intentos);
    end;
    
    intento := intento + 1;
  end;
end;