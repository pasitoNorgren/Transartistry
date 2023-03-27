protocol EditorConfigurable {
    var photo: Photo { get }
}

struct EditorConfiguration: EditorConfigurable {
    let photo: Photo
}
