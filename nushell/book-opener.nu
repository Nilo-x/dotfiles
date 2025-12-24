# Open PDF books using fzf and Firefox
# Usage:
#   book-opener           # Search in ~/Library
#   book-opener --all     # Search in entire home directory

def book-opener [
    --all (-a)  # Search all PDFs in home directory instead of just ~/Library
] {
    let search_path = if $all {
        $"($env.HOME)"
    } else {
        $"($env.HOME)/Library"
    }

    # Find all PDF files in the search path
    let pdfs = (
        try {
            (glob $"($search_path)/**/*.pdf")
            | append (glob $"($search_path)/*.pdf")
            | uniq
        } catch {
            []
        }
    )

    # Check if any PDFs were found
    if ($pdfs | is-empty) {
        print $"No PDF files found in ($search_path)"
        return
    }

    # Use fzf to select a book
    let selected = (
        $pdfs
        | str join (char newline)
        | fzf --preview 'echo {}' --preview-window=down:3:wrap
        | str trim
    )

    # Open the selected book in Firefox if something was selected
    if ($selected | is-not-empty) {
        firefox $selected
    }
}
