import UIKit

//In Swift, a global queue refers to the background queues managed by the system (via Grand Central Dispatch, GCD) that allow concurrent execution of tasks. These queues are part of the DispatchQueue.global() API and help perform background tasks efficiently without blocking the main thread.

/*Quality of Service (QoS) Levels
You can specify the priority (QoS) of a global queue:

.userInteractive – Highest priority, for UI updates.
.userInitiated – High priority, for tasks requested by the user.
.default – Medium priority (default).
.utility – Low priority, for background tasks (e.g., downloads).
.background – Lowest priority, for maintenance tasks (e.g., cleanup)*/

DispatchQueue.global().async {
    print("Task running in background")
}


class PhotoEditor {

    // UI update (highest priority)
    func updateUI() {
        print("Updating UI: Showing edited photo preview...")
    }

    // user-initiated task (high priority)
    func applyFilterToPhoto() {
        print("Applying filter to photo: User requested edit...")
    }

    // default task (medium priority)
    func savePhotoToDisk() {
        print("Saving photo to disk: Default priority task...")
    }

    // utility task (low priority)
    func downloadPhotoFromCloud() {
        print("Downloading photo from cloud: Background download...")
    }

    // background task (lowest priority)
    func cleanUpCache() {
        print("Cleaning up cache: Maintenance task...")
    }
}

let photoEditor = PhotoEditor()

// Perform tasks with different QoS levels
DispatchQueue.global(qos: .userInteractive).async {
    // Highest priority: UI update
    photoEditor.updateUI()
    print("UI update complete!\n")
}

DispatchQueue.global(qos: .userInitiated).async {
    // High priority: User-requested task
    photoEditor.applyFilterToPhoto()
    print("Filter applied!\n")
}

DispatchQueue.global(qos: .default).async {
    // Medium priority: Default task
    photoEditor.savePhotoToDisk()
    print("Photo saved!\n")
}

DispatchQueue.global(qos: .utility).async {
    // Low priority: utility task
    photoEditor.downloadPhotoFromCloud()
    print("Photo downloaded!\n")
}

DispatchQueue.global(qos: .background).async {
    // Lowest priority: background task
    photoEditor.cleanUpCache()
    print("Cache cleanup complete!\n")
}


