# CA Ants JSON editor
Load a file with json details on how to make the ant sim boards.

location
size 
rule
generations



JSON layout
```js
{
    "sim_layout_name": "Ant Farm",
    "cycles_ran": "300000",
    "boards": [
        {
            "id": "1",
            "x": "0",
            "y": "1",
            "width": "4",
            "height": "8",
            "rule": "0"
        },
        {
            "id": "2",
            "x": "0",
            "y": "1",
            "width": "10",
            "height": "8",
            "rule": "0"
        },
        {
            "id": "3",
            "x": "30",
            "y": "0",
            "width": "4",
            "height": "8",
            "rule": "0"
        },

    ]
}
```

Javascript functions
```js
JSON.parse()
JSON.stringify()
```