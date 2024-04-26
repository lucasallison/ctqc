import textwrap

class TableMaker:

    def __init__(self):
        self.columns = dict()
        self.column_order = list()
    
    def add_to_column(self, column: str, entry: str):
        if column in self.columns:
            self.columns[column].append(entry)
        else:
            self.columns[column] = [entry]
            self.column_order.append(column)
    

    def make(self):

        if len(self.column_order) == 0:
            raise RuntimeError("No columns added to the table.")


        if not all(len(list(self.columns.values())[0]) == len(ce) for ce in self.columns.values()):
            raise RuntimeError("Columns do not have the same number of entries.")


        column_headers = [f"\\textbf{{{column}}}" for column in self.column_order]

        rows = [' & '.join(list(row)) + '\\\\' for row in zip(self.columns.values())]
        print(rows)
        
        exit(0)
        
        textwrap.dedent(f"""
        \\begin{{center}}
        \\begin{{tabular}}{{ {"|".join(['c' for _ in range(len(self.column_order))])} }}
        \\hline
        {" & ".join(column_headers)} \\\\
        \\hline
        \\hline

          $I_cX_t$ & $I_cX_t$ \\\\
        $I_cY_t$ & $Z_cY_t$ \\\\
        
        \\hline
        \\end{{tabular}}
        \\end{{center}}
        """)

if __name__ == "__main__":
    tm = TableMaker()
    tm.add_to_column("in", "a")
    tm.add_to_column("in", "b")
    tm.add_to_column("out", "1")
    tm.add_to_column("out", "2")

    tm.make()
