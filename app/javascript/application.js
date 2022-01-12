// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
    const top_places = document.getElementById('top_seats')
    const bottom_places = document.getElementById('bottom_seats')
    const side_top_places = document.getElementById('side_top_seats')
    const side_bottom_places = document.getElementById('side_bottom_seats')
    const seat_places = document.getElementById('sitting_seats')

    let select = document.getElementById('carriage_type')
    const default_value = select.value

    const hide_unnecessary = (type) => {
        show(top_places, bottom_places, side_top_places, side_bottom_places, seat_places)
        switch (type) {
            case 'DefaultCarriage' :
                hide(seat_seats)
                break
            case 'CoupeCarriage' :
                hide(sitting_seats, side_bottom_seats, side_top_seats)
                break
            case 'PremiumCarriage' :
                hide(sitting_seats, side_bottom_seats, side_top_seats, top_seats)
                break
            case 'SeatedCarriage' :
                hide(top_seats, bottom_seats, side_top_seats, side_bottom_seats)
                break
        }
    }
    select.onchange = (e) => {
        let type = e.target.value
        hide_unnecessary(type)
    }

    hide_unnecessary(default_value)
})

const hide = (...args) => {
    args.map((elem) => {
        elem.style.display = 'none'
    })
}

const show = (...args) => {
    args.map((elem) => {
        elem.style.display = 'block'
    })
}
