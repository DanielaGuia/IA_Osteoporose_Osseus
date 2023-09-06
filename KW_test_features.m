

data= readtable('Dados_Osseus.xlsx');


[p,table,stats]=kruskalwallis(data.idade, data.diagnostico,"on")
table{2,5}

[p,table,stats]=kruskalwallis(data.imc, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.genero, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.corticoide, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.menopausa, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.diferenca, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.cigarro, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.alcool, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.paisencurvados, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.paisosteoporose, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.doencas, data.diagnostico, "on")
table{2,5}

[p,table,stats]=kruskalwallis(data.artrite, data.diagnostico, "on")
table{2,5}