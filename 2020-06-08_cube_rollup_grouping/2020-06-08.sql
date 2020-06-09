insert into funcionario values(6, 'Laura', 4000, 2, 'Analista');

--ROLLUP: Mostra subtotais e um total geral
select dep_id, sum(func_sal)
from funcionario
group by rollup(dep_id);

select dep_id, fun_cargo, sum(func_sal)
from funcionario
group by rollup(dep_id, fun_cargo);

--CUBE: e uma Tabulacao Cruzada que mostra todas as combinações possiveis de linha
select dep_id, fun_cargo, sum(func_sal)
from funcionario
group by cube(dep_id, fun_cargo);

--GROUPING: Coloca o numero 1 onde aconteceu um agrupamento
select dep_id, fun_cargo, func_sal, round(avg(func_sal)), count(*), grouping(dep_id), grouping(fun_cargo)
from funcionario
group by rollup(dep_id , fun_cargo, func_sal)
order by dep_id, fun_cargo, func_sal;
