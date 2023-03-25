import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';
  const FiltersScreen(
      {super.key, required this.filters, required this.setFilters});

  final Map<String, bool> filters;
  final Function setFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegan = false;
  bool _vegetarian = false;
  bool _glutenFree = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _vegan = widget.filters['vegan']!;
    _glutenFree = widget.filters['gluten']!;
    _lactoseFree = widget.filters['lactose']!;
    _vegetarian = widget.filters['vegetarian']!;
    super.initState();
  }

  Widget _buildFilters(
      String title, String subtitle, bool filter, Function(bool) updateValue) {
    return SwitchListTile.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: filter,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final filterData = {
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
                'gluten': _glutenFree,
                'vegan': _vegan,
              };
              widget.setFilters(filterData);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildFilters(
                'Vegan',
                'Only include vegan meals.',
                _vegan,
                (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
              _buildFilters(
                'Vegetarian',
                'Only include vegetarian meals.',
                _vegetarian,
                (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              _buildFilters(
                'Glutten Free',
                'Only include gluten free meals.',
                _glutenFree,
                (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              _buildFilters(
                'Lactose Free',
                'Only include lactose free meals.',
                _lactoseFree,
                (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
