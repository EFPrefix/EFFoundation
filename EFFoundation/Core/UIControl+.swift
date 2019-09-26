//
//  UIButton+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

public extension UIControl {

    private static var blockDict: [UInt: ((UIControl) -> Void)?] = [:]

    private func selectorFor(_ event: UIControl.Event) -> Selector? {
        switch event {
        case .touchDown:
            return #selector(touchDown)
        case .touchDownRepeat:
            return #selector(touchDownRepeat)
        case .touchDragInside:
            return #selector(touchDragInside)
        case .touchDragOutside:
            return #selector(touchDragOutside)
        case .touchDragEnter:
            return #selector(touchDragEnter)
        case .touchDragExit:
            return #selector(touchDragExit)
        case .touchUpInside:
            return #selector(touchUpInside)
        case .touchUpOutside:
            return #selector(touchUpOutside)
        case .touchCancel:
            return #selector(touchCancel)
        case .valueChanged:
            return #selector(valueChanged)
        case .editingDidBegin:
            return #selector(editingDidBegin)
        case .editingChanged:
            return #selector(editingChanged)
        case .editingDidEnd:
            return #selector(editingDidEnd)
        case .editingDidEndOnExit:
            return #selector(editingDidEndOnExit)
        case .allTouchEvents:
            return #selector(allTouchEvents)
        case .allEditingEvents:
            return #selector(allEditingEvents)
        case .applicationReserved:
            return #selector(applicationReserved)
        case .systemReserved:
            return #selector(systemReserved)
        case .allEvents:
            return #selector(allEvents)
        default:
            if #available(iOS 9, *) {
                if event == .primaryActionTriggered {
                    return #selector(primaryActionTriggered)
                }
            }
            return nil
        }
    }

    private func callActionFor(_ event: UIControl.Event) {
        UIButton.blockDict[event.rawValue]??(self)
    }

    @objc private func touchDown() {
        callActionFor(UIControl.Event.touchDown)
    }

    @objc private func touchDownRepeat() {
        callActionFor(UIControl.Event.touchDownRepeat)
    }

    @objc private func touchDragInside() {
        callActionFor(UIControl.Event.touchDragInside)
    }

    @objc private func touchDragOutside() {
        callActionFor(UIControl.Event.touchDragOutside)
    }

    @objc private func touchDragEnter() {
        callActionFor(UIControl.Event.touchDragEnter)
    }

    @objc private func touchDragExit() {
        callActionFor(UIControl.Event.touchDragExit)
    }

    @objc private func touchUpInside() {
        callActionFor(UIControl.Event.touchUpInside)
    }

    @objc private func touchUpOutside() {
        callActionFor(UIControl.Event.touchUpOutside)
    }

    @objc private func touchCancel() {
        callActionFor(UIControl.Event.touchCancel)
    }

    @objc private func valueChanged() {
        callActionFor(UIControl.Event.valueChanged)
    }

    @available(iOS 9.0, *)
    @objc private func primaryActionTriggered() {
        callActionFor(UIControl.Event.primaryActionTriggered)
    }

    @objc private func editingDidBegin() {
        callActionFor(UIControl.Event.editingDidBegin)
    }

    @objc private func editingChanged() {
        callActionFor(UIControl.Event.editingChanged)
    }

    @objc private func editingDidEnd() {
        callActionFor(UIControl.Event.editingDidEnd)
    }

    @objc private func editingDidEndOnExit() {
        callActionFor(UIControl.Event.editingDidEndOnExit)
    }

    @objc private func allTouchEvents() {
        callActionFor(UIControl.Event.allTouchEvents)
    }

    @objc private func allEditingEvents() {
        callActionFor(UIControl.Event.allEditingEvents)
    }

    @objc private func applicationReserved() {
        callActionFor(UIControl.Event.applicationReserved)
    }

    @objc private func systemReserved() {
        callActionFor(UIControl.Event.systemReserved)
    }

    @objc private func allEvents() {
        callActionFor(UIControl.Event.allEvents)
    }

    func addEventHandler(_ event: UIControl.Event, action: ((UIControl) -> Void)?) {
        guard let selector = selectorFor(event) else { return }
        UIButton.blockDict.updateValue(action, forKey: event.rawValue)
        if nil == action {
            removeTarget(self, action: selector, for: event)
        } else {
            addTarget(self, action: selector, for: event)
        }
    }

    func removeEventHandler(_ event: UIControl.Event) {
        addEventHandler(event, action: nil)
    }

    func addTouchDownHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchDown, action: action)
    }

    func addTouchDownRepeatHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchDownRepeat, action: action)
    }

    func addTouchDragInsideHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchDragInside, action: action)
    }

    func addTouchDragOutsideHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchDragOutside, action: action)
    }

    func addTouchDragEnterHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchDragEnter, action: action)
    }

    func addTouchDragExitHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchDragExit, action: action)
    }

    func addTouchUpInsideHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchUpInside, action: action)
    }

    func addTouchUpOutsideHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchUpOutside, action: action)
    }

    func addTouchCancelHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.touchCancel, action: action)
    }

    func addValueChangedHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.valueChanged, action: action)
    }

    @available(iOS 9.0, *)
    func addPrimaryActionTriggeredHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.primaryActionTriggered, action: action)
    }

    func addEditingDidBeginHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.editingDidBegin, action: action)
    }

    func addEditingChangedHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.editingChanged, action: action)
    }

    func addEditingDidEndHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.editingDidEnd, action: action)
    }

    func addEditingDidEndOnExitHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.editingDidEndOnExit, action: action)
    }

    func addAllTouchEventsHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.allTouchEvents, action: action)
    }

    func addAllEditingEventsHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.allEditingEvents, action: action)
    }

    func addApplicationReservedHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.applicationReserved, action: action)
    }

    func addSystemReservedHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.systemReserved, action: action)
    }

    func addAllEventsHandler(_ action: ((UIControl) -> Void)?) {
        addEventHandler(UIControl.Event.allEvents, action: action)
    }
}
#endif
