-- Archivo con funciones para filtrar cosas que mostrar en el documento final
-- Versiones del archivo
FULL = "full"
BASE = "base"

-- Partes a incluir
local file_structure = {
    {BASE, "fundamentos"},
    {BASE, "funciones"},
    {FULL, "secuencias"},
    {FULL, "archivos"}
}

-- Función para filtrar inclusión u omisión de archivos
function load_files()
    -- Itera sobre una lista de archivos
    for _, item in ipairs(file_structure) do
        local version = item[1]
        local file_name = item[2]

        -- Si es la versión correcta del archivo, lo vomita
        if doc_version == FULL or version == doc_version then
            tex.sprint("\\input{" .. file_name .. "}")
        end
    end
end

-- Función para filtrar un elemento
function filter_version(version, contents)
    -- Muestra el contenido solo si está con la versión correcta
    if doc_version == version or doc_version == FULL then
        -- Como esto tomará instrucciones de minted, hay que mantener la estructura, cosa que
        -- se puede hacer con print, en vez de sprint
        local lines = {}

        -- Convierte el texto a una lista separada por saltos de línea
        -- Esto es brujería de Lua que copié y pegué :'v
        -- Al parecer, string.gmatch(s, pattern) convierte una cadena en una lista separada por el
        -- "Lua pattern" (regex simplificada) dado como parámetro
        for line in (contents .. "\n"):gmatch("(.-)\r?\n") do
            table.insert(lines, line)
        end
        -- Vomita el texto en bruto
        tex.print(lines)
    end
end
