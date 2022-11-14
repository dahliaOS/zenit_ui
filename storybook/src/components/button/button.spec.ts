import { newSpecPage } from "@stencil/core/testing";
import { Button } from "./button";

describe('zenit-button', () => {
  it('renders', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button>Text</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button>
        <mock:shadow-root>
          <button>
            <slot></slot>
          </button>
        </mock:shadow-root>
        Text
      </zenit-button>
    `);
  });

  it('renders with primary class', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button primary>Primary</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button primary>
        <mock:shadow-root>
          <button class="zenit-primary">
            <slot></slot>
          </button>
        </mock:shadow-root>
        Primary
      </zenit-button>
    `);
  });

  it('renders as disabled', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button disabled>Veteran (we salute you)</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button disabled>
        <mock:shadow-root>
          <button disabled>
            <slot></slot>
          </button>
        </mock:shadow-root>
        Veteran (we salute you)
      </zenit-button>
    `);
  });

  it('uses "zenit-primary" class for primary buttons', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button primary>Vote now</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button primary>
        <mock:shadow-root>
          <button class="zenit-primary">
            <slot />
          </button>
        </mock:shadow-root>
        Vote now
      </zenit-button>
    `);
  });

  it('uses "zenit-tertiary" class for transparent buttons', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button transparent>Button</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button transparent>
        <mock:shadow-root>
          <button class="zenit-tertiary">
            <slot />
          </button>
        </mock:shadow-root>
        Button
      </zenit-button>
    `);
  });

  it('only uses "zenit-primary" class for buttons with both tertiary and primary', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button tertiary primary>I\'m mixed!</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button tertiary primary>
        <mock:shadow-root>
          <button class="zenit-primary">
            <slot />
          </button>
        </mock:shadow-root>
        I'm mixed!
      </zenit-button>
    `);
  });

  it('uses "zenit-square" class for icon buttons', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button icon><i class="lucide:house"></i></zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button icon>
        <mock:shadow-root>
          <button class="zenit-square">
            <slot />
          </button>
        </mock:shadow-root>
        <i class="lucide:house"></i>
      </zenit-button>
    `);
  });
});