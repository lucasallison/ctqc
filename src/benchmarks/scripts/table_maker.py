import textwrap


class TableMaker:

    def __init__(self):
        self.columns = dict()
        self.column_order = list()

    def add_to_column(self, column: str, entries: list):
        if column in self.columns:
            if len(entries) != len(self.columns[column][0]):
                raise RuntimeError(
                    "Entries do not have the same length as the previous entries in the column.")
            self.columns[column].append(entries)
        else:
            self.columns[column] = [entries]
            self.column_order.append(column)

    def make(self):

        if len(self.column_order) == 0:
            raise RuntimeError("No columns added to the table.")

        if not all(len(list(self.columns.values())[0]) == len(ce) for ce in self.columns.values()):
            raise RuntimeError(
                "Columns do not have the same number of entries.")

        column_headers = [f"\\multicolumn{{{len(self.columns[column][0])}}}{{c|}}{{\\textbf{{{column}}}}}" for column in self.column_order]

        rows = []
        for row in zip(*self.columns.values()):
            rows.append([e for l in row for e in l])

        rows = [' & '.join(row) + ' \\\\' for row in rows]
        rows = '\n'.join(rows)

        n_rows = sum([len(col[0]) for col in self.columns.values()])

        table = f"""\\begin{{center}}
        \\begin{{tabular}}{{ {"|".join(['c' for _ in range(n_rows)])} }}
        \\hline
        {" & ".join(column_headers)} \\\\
        \\hline
        \\hline
        {rows}
        \\hline
        \\end{{tabular}}
        \\end{{center}}"""

        table = map(str.lstrip, table.splitlines())
        return '\n'.join(table)


if __name__ == "__main__":
    tm = TableMaker()
    tm.add_to_column("in", ["a", "1"])
    tm.add_to_column("in", ["b", "2"])
    tm.add_to_column("out", ["1"])
    tm.add_to_column("out", ["2"])

    print(tm.make())
