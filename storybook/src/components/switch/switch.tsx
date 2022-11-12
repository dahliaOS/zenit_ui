import { Component, Prop, h, Host, Listen } from '@stencil/core';

@Component({
  tag: 'zenit-switch',
  styleUrl: 'switch.scss',
  shadow: true,
})
export class Switch {
  /**
   * Whether the switch is on (true) or off (false).
   */
  @Prop() checked: boolean;

  /**
   * Whether the button should not be clickable.
   */
  @Prop() disabled: boolean;

  // @Event({
  //   eventName: 'click',
  //   composed: true,
  //   cancelable: true,
  //   bubbles: true,
  // }) click: EventEmitter<MouseEvent>;

  @Listen('click')
  onClickHandler(event: MouseEvent) {
    if (!event.defaultPrevented && !this.disabled) {
      console.log("click!");
      this.checked = !this.checked;
    }
  }

  render() {
    return <Host tabindex={0} role="switch" aria-checked={this.checked ? "true" : "false"} aria-disabled={this.disabled}>
      <svg data-checked={this.checked} data-disabled={this.disabled} width="48" height="24" viewBox="0 0 48 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect class="--bg" width="48" height="24" rx="12" fill="#00B26E" />
        <rect class="--thumb" width="16" height="16" x="4" y="4" rx="8" fill="#FAFAFA" />
      </svg>
    </Host>;
  }
}
