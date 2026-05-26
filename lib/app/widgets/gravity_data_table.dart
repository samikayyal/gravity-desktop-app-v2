import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

enum GravityTableColumnAlignment { text, number, action }

class GravityTableColumn {
  const GravityTableColumn({
    required this.label,
    this.flex = 1,
    this.width,
    this.alignment = GravityTableColumnAlignment.text,
  }) : assert(flex > 0),
       assert(width == null || width > 0);

  final String label;
  final int flex;
  final double? width;
  final GravityTableColumnAlignment alignment;
}

class GravityTableCell {
  const GravityTableCell.text(this.text, {this.key, this.tooltip})
    : child = null;

  const GravityTableCell.widget(this.child, {this.key, this.tooltip})
    : text = null;

  final String? text;
  final Widget? child;
  final Key? key;
  final String? tooltip;
}

class GravityTableRow {
  const GravityTableRow({required this.cells, this.onTap});

  final List<GravityTableCell> cells;
  final VoidCallback? onTap;
}

class GravityDataTable extends StatelessWidget {
  const GravityDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.rowHeight = 44,
    this.headingHeight = 38,
  }) : assert(rowHeight >= 36),
       assert(headingHeight >= 32);

  final List<GravityTableColumn> columns;
  final List<GravityTableRow> rows;
  final double rowHeight;
  final double headingHeight;

  @override
  Widget build(BuildContext context) {
    assert(
      columns.isNotEmpty &&
          rows.every((row) => row.cells.length == columns.length),
      'GravityDataTable needs columns and matching row cells.',
    );

    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.mdBorder,
        border: Border.all(color: colorScheme.outline),
      ),
      child: ClipRRect(
        borderRadius: AppRadius.mdBorder,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _GravityTableHeader(columns: columns, height: headingHeight),
            for (var index = 0; index < rows.length; index += 1)
              _GravityTableDataRow(
                columns: columns,
                row: rows[index],
                index: index,
                height: rowHeight,
              ),
          ],
        ),
      ),
    );
  }
}

class _GravityTableHeader extends StatelessWidget {
  const _GravityTableHeader({required this.columns, required this.height});

  final List<GravityTableColumn> columns;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColorTokens.neutralBackground,
        border: Border(bottom: BorderSide(color: colorScheme.outline)),
      ),
      child: Row(
        children: [
          for (final column in columns)
            _buildColumnSlot(
              column,
              _GravityTableCellFrame(
                alignment: column.alignment,
                child: Text(
                  column.label.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  textAlign: _textAlign(column.alignment),
                  style: theme.dataTableTheme.headingTextStyle?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GravityTableDataRow extends StatelessWidget {
  const _GravityTableDataRow({
    required this.columns,
    required this.row,
    required this.index,
    required this.height,
  });

  final List<GravityTableColumn> columns;
  final GravityTableRow row;
  final int index;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final backgroundColor = index.isEven
        ? colorScheme.surface
        : AppColorTokens.neutralBackground;

    final rowContent = Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(bottom: BorderSide(color: colorScheme.outline)),
      ),
      child: Row(
        children: [
          for (
            var columnIndex = 0;
            columnIndex < columns.length;
            columnIndex += 1
          )
            _buildColumnSlot(
              columns[columnIndex],
              _GravityTableCellFrame(
                alignment: columns[columnIndex].alignment,
                child: _GravityTableCellContent(
                  cell: row.cells[columnIndex],
                  alignment: columns[columnIndex].alignment,
                  dataTextStyle: theme.dataTableTheme.dataTextStyle,
                ),
              ),
            ),
        ],
      ),
    );

    if (row.onTap == null) {
      return rowContent;
    }

    return InkWell(
      onTap: row.onTap,
      mouseCursor: SystemMouseCursors.click,
      child: rowContent,
    );
  }
}

class _GravityTableCellContent extends StatelessWidget {
  const _GravityTableCellContent({
    required this.cell,
    required this.alignment,
    required this.dataTextStyle,
  });

  final GravityTableCell cell;
  final GravityTableColumnAlignment alignment;
  final TextStyle? dataTextStyle;

  @override
  Widget build(BuildContext context) {
    if (cell.child != null) {
      return cell.child!;
    }

    final theme = Theme.of(context);
    final isNumber = alignment == GravityTableColumnAlignment.number;
    final style = isNumber
        ? (dataTextStyle ?? theme.textTheme.bodyMedium)?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
          )
        : theme.textTheme.bodyMedium;
    final text = Text(
      cell.text ?? '',
      key: cell.key,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      textAlign: _textAlign(alignment),
      style: style,
    );

    if (cell.tooltip == null) {
      return text;
    }

    return Tooltip(message: cell.tooltip, child: text);
  }
}

class _GravityTableCellFrame extends StatelessWidget {
  const _GravityTableCellFrame({required this.alignment, required this.child});

  final GravityTableColumnAlignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm),
      child: Align(alignment: _alignment(alignment), child: child),
    );
  }
}

Widget _buildColumnSlot(GravityTableColumn column, Widget child) {
  if (column.width != null) {
    return SizedBox(width: column.width, child: child);
  }

  return Expanded(flex: column.flex, child: child);
}

AlignmentGeometry _alignment(GravityTableColumnAlignment alignment) {
  return switch (alignment) {
    GravityTableColumnAlignment.text => AlignmentDirectional.centerStart,
    GravityTableColumnAlignment.number => AlignmentDirectional.centerEnd,
    GravityTableColumnAlignment.action => Alignment.center,
  };
}

TextAlign _textAlign(GravityTableColumnAlignment alignment) {
  return switch (alignment) {
    GravityTableColumnAlignment.text => TextAlign.start,
    GravityTableColumnAlignment.number => TextAlign.end,
    GravityTableColumnAlignment.action => TextAlign.center,
  };
}
