function filterSelectChange(id) {
    const selectSpec = document.getElementById('specialization');
    const selectRoot = document.getElementById('area_root');
    const selectParent = document.getElementById('area_parent');
    const selectChild = document.getElementById('area_child');
    const areaId = document.getElementById('areaId');
    const specId = document.getElementById('specId');
    let collection;
    let parentId;
    let childId;

    switch (id) {
        case 'area_root':
            const rootArea = selectRoot.options[selectRoot.selectedIndex];
            collection = selectParent.options;
            for (let i = 0; i < collection.length; i++) {
                collection.item(i).selected = false;
                if (collection.item(i).getAttribute('data-parentId') !==
                    rootArea.getAttribute('data-id')) {
                    collection.item(i).hidden = true
                } else {
                    collection.item(i).hidden = false;
                    if (parentId === undefined) {
                        collection.item(i).selected = true;
                        parentId = collection.item(i).getAttribute('data-id');
                    }
                }
            }
            for (let j = 1; j < selectChild.options.length; j++) {
                selectChild.options.item(j).selected = false;
                if (selectChild.options.item(j).getAttribute('data-parentId') !== parentId) {
                    selectChild.options.item(j).hidden = true;
                } else {
                    selectChild.options.item(j).hidden = false;
                    if (childId === undefined) {
                        childId = selectChild.options.item(j).getAttribute('data-id');
                        selectChild.options.item(j).selected = true;
                        areaId.value = childId;
                    }
                }
            }
            break;
        case 'area_parent':
            const parentArea = selectParent.options[selectParent.selectedIndex];
            parentId = parentArea.getAttribute('data-id');
            collection = selectChild.options;
            for (let i = 0; i < collection.length; i++) {
                collection.item(i).selected = false;
                if (collection.item(i).getAttribute('data-parentId') !== parentId) {
                    collection.item(i).hidden = true;
                } else {
                    collection.item(i).hidden = false;
                    if (childId === undefined) {
                        collection.item(i).selected = true;
                        childId = collection.item(i).getAttribute('data-id');
                        areaId.value = childId;
                    }
                }
            }
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


