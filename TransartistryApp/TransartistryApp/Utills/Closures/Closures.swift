typealias Closure<Input, Output> = (Input) -> Output
typealias ParameterClosure<Input> = Closure<Input, Void>
typealias ResultClosure<Output> = () -> Output
typealias VoidClosure = ResultClosure<Void>
