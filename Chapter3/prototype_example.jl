using GLPK: optimize!
#=
Company Name: WYNDOR GLASS CO

Problem:
Objective: Maximize Z = 3x₁ + 5x₂

Constraints:
    x₁ <= 4
    2x₂ <= 12
    3x₁ + 2x₂ <= 18

    x₁ >= 0, x₂ >= 0
=#

using JuMP
using GLPK ## The Solver

## Our model instance
model = Model(GLPK.Optimizer)

## Defining our variables
@variable(model, x₁ >= 0)
@variable(model, x₂ >= 0)

## Defining the constraints
@constraint(model, x₁ <= 4)
@constraint(model, 2*x₂ <= 12)
@constraint(model, 3*x₁ + 2*x₂ <= 18)

## Objective
@objective(model, Max, 3*x₁ + 5*x₂)

println(model)

## Find the optimal solution
optimize!(model)

## Get the x₁ & x₂ values
@show value(x₁)
@show value(x₂)