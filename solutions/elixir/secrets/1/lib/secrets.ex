defmodule Secrets do
  def secret_add(secret) do
    adder = fn val -> val + secret end
  end

  def secret_subtract(secret) do
    subtractor = fn val -> val - secret end
  end

  def secret_multiply(secret) do
    multiplier = fn val -> val * secret end
  end

  def secret_divide(secret) do
    divider = fn val -> div(val, secret) end
  end

  def secret_and(secret) do
    ander = fn val -> Bitwise.band(secret, val) end
  end

  def secret_xor(secret) do
    bxorer = fn val -> Bitwise.bxor(secret, val) end
  end

  def secret_combine(secret_function1, secret_function2) do
    combined = fn val -> secret_function2.(secret_function1.(val)) end
  end
end
