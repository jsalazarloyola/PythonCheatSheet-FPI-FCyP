def func(x):
    if condición(x):
        new_x = operaciones(x)
        return func(new_x)
    else:
        return otras_operaciones(x)