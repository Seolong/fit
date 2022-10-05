enum ClothType {
    top, bottom, outer, other
}

extension ToClothType on String{
    ClothType toClothType() {
        return ClothType.values.byName(this);
    }
}