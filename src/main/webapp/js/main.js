function filterSelectChange(id) {
    const selectSpec = document.getElementById('specialization');
    const selectRoot = document.getElementById('area_root');
    const selectParent = document.getElementById('area_parent');
    const selectChild = document.getElementById('area_child');
    const areaId = document.getElementById('areaId');
    const specId = document.getElementById('specId');
    let collection;

    switch (id) {
        case 'area_root':
            const rootArea = selectRoot.options[selectRoot.selectedIndex];
            collection = selectParent.options;
            for (let i = 0; i < collection.length; i++) {
                collection.item(i).hidden =
                    collection.item(i).getAttribute('data-parentId') !==
                    rootArea.getAttribute('data-id');
                collection.item(i).selected = false;
            }
            collection.item(0).selected = true;
            for (let j = 1; j < selectChild.options.length; j++) {
                selectChild.options.item(j).hidden = true;
                selectChild.options.item(j).selected = false;
            }
            selectChild.options.item(0).selected = true;
            selectChild.options.item(0).hidden = true;
            areaId.value = rootArea.getAttribute('data-id');
            break;
        case 'area_parent':
            const parentArea = selectParent.options[selectParent.selectedIndex];
            collection = selectChild.options;
            for (let i = 0; i < collection.length; i++) {
                collection.item(i).hidden =
                    collection.item(i).getAttribute('data-parentId') !==
                    parentArea.getAttribute('data-id');
                collection.item(i).selected = false;
            }
            collection.item(0).selected = true;
            areaId.value = parentArea.getAttribute('data-id');
            break;
        case 'area_child':
            const childArea = selectChild.options[selectChild.selectedIndex];
            areaId.value = childArea.getAttribute('data-id');
            break;
        case 'spec':
            const specInput = selectSpec.options[selectSpec.selectedIndex];
            specId.value = specInput.getAttribute('data-id');
            break;
    }
}

